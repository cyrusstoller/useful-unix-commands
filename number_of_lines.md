Total number of lines of code in a directory
```
  find {{directory path or paths}} -type f -exec wc -l {} \; | awk '{total += $1} END{print total}'
```