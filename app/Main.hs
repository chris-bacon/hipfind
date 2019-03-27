{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.List
import qualified Data.Text              as Text
import           System.Environment
import           System.Directory
import qualified Data.Char              as Char
import           System.IO.Unsafe
import qualified System.FilePath        as FP
import qualified System.Posix.Files     as FF
import           Control.Parallel.Strategies
import qualified Control.Monad.Parallel as Parallel

main :: IO ()
main = do
  args <- getArgs
  case args of
    [patternToFind,dirToSearch] -> do
      rootPath <- makeAbsolute dirToSearch

      matchedFiles <- traverseAndLogT rootPath (Text.pack patternToFind)

      case matchedFiles of
        [] -> return ()
        _  -> mapM_ (putStrLn . Text.unpack) matchedFiles >> return ()

    _ -> putStrLn format

format :: String
format = "hipfind <pattern> <dir_to_search_recursively_in>"

traverseAndLogT :: FilePath -> Text.Text -> IO [Text.Text]
traverseAndLogT path _pattern = do
  dirList <- listDirectory path
  let res = caseInsensitiveSearchText _pattern (Text.pack <$> dirList)

  let subDirs = filter (\x -> unsafePerformIO $ isDirectory (path FP.</> x)) dirList
  aggregateRes <- Parallel.mapM (\subDir -> traverseAndLogT (path FP.</> subDir) _pattern) subDirs

  let resWithPath = Text.append (Text.pack (path ++ "/")) <$> res

  return $ resWithPath ++ mconcat aggregateRes

isDirectory :: FilePath -> IO Bool
isDirectory p = FF.isDirectory <$> FF.getFileStatus p

caseInsensitiveSearchText :: Text.Text -> [Text.Text] -> [Text.Text]
caseInsensitiveSearchText p files =
  let lowerCasedPath  = Text.toLower p
      lowerCasedFiles = fmap Text.toLower files
   in filter (lowerCasedPath `Text.isInfixOf`) lowerCasedFiles

caseSensitiveSearchText :: Text.Text -> [Text.Text] -> [Text.Text]
caseSensitiveSearchText p = filter (p `Text.isInfixOf`)
