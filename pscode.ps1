<#
========================================================================
PowerShell 5.1 Interview Exercises
Commonly Asked Simple Scripting Tasks for DevOps / Admin Roles
========================================================================
#>

# ============================================================
# 1. Factorial of a Number
# ============================================================
function Get-Factorial {
    param([int]$Number)
    if ($Number -lt 0) { throw "Negative numbers not allowed" }
    $result = 1
    for ($i = 2; $i -le $Number; $i++) { $result *= $i }
    return $result
}
Write-Output "Factorial of 5: $(Get-Factorial 5)"

# ============================================================
# 2. Find Greatest of 3 Numbers
# ============================================================
$a=10; $b=25; $c=15
$max = if($a -ge $b -and $a -ge $c){$a} elseif($b -ge $c){$b}else{$c}
Write-Output "Greatest number: $max"

# ============================================================
# 3. Check if a Number is Prime
# ============================================================
$n=17
$isPrime=$true
for($i=2; $i -le [math]::Sqrt($n); $i++){
    if($n % $i -eq 0){ $isPrime=$false; break }
}
Write-Output "Is $n prime? $isPrime"

# ============================================================
# 4. Reverse a String
# ============================================================
$str="PowerShell"
$reversed = -join ($str.ToCharArray() | ForEach-Object {$_})[::1] | ForEach-Object {$_} # PS5.1 compatible
$reversed = -join [array]::Reverse($str.ToCharArray())  # alternate
Write-Output "Reversed string: $reversed"

$str = "Hello World"
# Access characters using a range operator from last index to first
$reversedArray = $str[-1..-($str.Length)]
# Join the characters back into a single string
$reversedStr = -join $reversedArray

Write-Output $reversedStr
# Output: dlroW olleH


# ============================================================
# 5. Sum of Array Elements
# ============================================================
$arr=1,2,3,4,5
$sum=0
foreach($i in $arr){$sum+=$i}
Write-Output "Sum: $sum"

# ============================================================
# 6. Maximum and Minimum in Array
# ============================================================
$arr=4,7,1,9,3
$max=($arr | Measure-Object -Maximum).Maximum
$min=($arr | Measure-Object -Minimum).Minimum
Write-Output "Max: $max, Min: $min"

# ============================================================
# 7. Check Palindrome
# ============================================================
$str="madam"
$rev = -join ($str.ToCharArray() | ForEach-Object {$_})[::1]
$rev = -join [array]::Reverse($str.ToCharArray()) 
if($str -eq $rev){ Write-Output "$str is a Palindrome" } else { Write-Output "$str is not a Palindrome" }

# ============================================================
# 8. Count Files in a Folder
# ============================================================
$folder="C:\Temp"
if(Test-Path $folder){
    $count=(Get-ChildItem $folder | Measure-Object).Count
    Write-Output "Files in $folder: $count"
} else { Write-Output "$folder does not exist" }

# ============================================================
# 9. Read CSV and Print a Column
# ============================================================
# $csv=Import-Csv "C:\Temp\data.csv"
# foreach($row in $csv){ Write-Output $row.Name }

# ============================================================
# 10. Multiplication Table of a Number
# ============================================================
$n=5
for($i=1;$i -le 10;$i++){
    Write-Output "$n x $i = $($n*$i)"
}

# ============================================================
# 11. Reverse Words in Sentence
# ============================================================
$sentence="PowerShell is fun"
$reversed = ($sentence -split " " | ForEach-Object {$_})[::1]
$reversed = ($sentence -split " " | ForEach-Object {$_} | [array]::Reverse($_)) -join " "
Write-Output "Reversed words: $reversed"

# ============================================================
# 12. Remove Duplicates from Array
# ============================================================
$arr = 1,2,3,2,1,4
$unique = $arr | Sort-Object -Unique
Write-Output "Unique elements: $unique"

# ============================================================
# 13. Check Even or Odd
# ============================================================
$n=7
if($n % 2 -eq 0){ Write-Output "$n is Even" } else { Write-Output "$n is Odd" }

# ============================================================
# 14. Fibonacci Series
# ============================================================
$n=10
$a=0;$b=1
for($i=1;$i -le $n;$i++){
    Write-Output $a
    $sum=$a+$b
    $a=$b
    $b=$sum
}

# ============================================================
# 15. Average of Array
# ============================================================
$arr=2,4,6,8,10
$avg=($arr | Measure-Object -Average).Average
Write-Output "Average: $avg"

# ============================================================
# 16. Celsius to Fahrenheit
# ============================================================
$c=30
$f=($c*9/5)+32
Write-Output "$c C = $f F"

# ============================================================
# 17. File Exists
# ============================================================
$path="C:\Temp\test.txt"
if(Test-Path $path){ Write-Output "$path exists" } else { Write-Output "$path not found" }

# ============================================================
# 18. Largest Word in Sentence
# ============================================================
$sentence="PowerShell scripting is fun"
$largest = ($sentence -split " " | Sort-Object Length -Descending)[0]
Write-Output "Largest word: $largest"

# ============================================================
# 19. Count Vowels in String
# ============================================================
$str="PowerShell"
$vowels = "aeiou"
$count=0
foreach($ch in $str.ToLower().ToCharArray()){
    if($vowels -contains $ch){ $count++ }
}
Write-Output "Vowel count: $count"

# ============================================================
# 20. Display Running Services
# ============================================================
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -Property Name, Status
