Total number of lines of code in a directory
([credit](http://stv.whtly.com/2012/05/09/unix-count-total-number-of-lines-in-all-files-recursively/))
```
$> find {{directory path or paths}} -type f -exec wc -l {} \; | awk '{total += $1} END{print total}'
```
