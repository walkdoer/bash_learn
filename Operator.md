操作符列表
========================

### `!` 逻辑非，后面记得带空格，不带空格是启用bash的历史极致
```
! true
!true  #Command not found
```

### `[ ]` 运算符记得要带空格，不带空格会报错

```bash
if ["$a" -ne "$b"] # Wrong
then
    echo "$a is not equal to $b"
    echo "算术比较"
else
    echo "same"
fi
```
