
Simple cases:

Have:
```
func Ok(isOk bool) string {
	if Ok { return "b" }
	return "a"
}
```

Have:
```
func Fn(i int) string {
	switch {
	case i%2 == 0: return "a"
	case i%3 == 0: return "b"
	case i == 7: return "c"
	default: return "d"
	}
}
```



Real cases:


Case R1:
```
func (r Res[V, E]) Err(f func(Error[E])) V {
	if f == nil { return r.Value }
	if r.Error != nil { f(r.Error) }
	return r.Value
}
```

Case R2:
```go
func Results[V, E any](value V, err any) (res Res[V, E]) {
	res = Res[V, E]{Value: value}
	if err == nil { return res }

	switch err := err.(type) {
	case Error[E]: res.Error = err
	case E: res.Error = Err[E]{Val: err}
	case string: res.Error = Err[E]{Err: StrError(err)}
	default: panic("invalid error type")
	}

	return res
}
```

Expect R1:
```
func (r Res[V, E]) Err(f func(Error[E])) V {
	if f == nil { return r.Value }
	if r.Error != nil { f(r.Error) }
	return r.Value
}
```


Expect R2:
```go
func Results[V, E any](value V, err any) (res Res[V, E]) {
	res = Res[V, E]{Value: value}
	if err == nil { return res }

	switch err := err.(type) {
		case Error[E]: res.Error = err
		case E: res.Error = Err[E]{Val: err}
		case string: res.Error = Err[E]{Err: StrError(err)}
		default: panic("invalid error type")
	}

	return res
}
```

Got R2:


Formatting not wanted:
Case N1:
```
func Fn(i int) string {
	switch {
	case i%2 == 0:
		println("a")
		return "a"
	case i%3 == 0:
		println("b")
		return "b"
	case i == 7:
		println("c")
		return "c"
	default:
		println("d")
		return "d"
	}
}
```
Got N1:

Case N2:
```
func Ok(isOk bool) string {
	if Ok {
		res := ""
		res += "b"
		return "b"
	}
	return "a"
}
```





=====================================================================
Simple cases:

Case S1:
```
func Ok(isOk bool) string {
	if Ok { return "b" }
	return "a"
}
```
Expect S1:
```
func Ok(isOk bool) string {
	if Ok { return "b" }
	return "a"
}
```
Got S1:
```
func Ok(isOk bool) string {
	if Ok { return "b" }
	return "a"
}
```
S1 PASS!

Case S2:
```
func Fn(i int) string {
	switch {
	case i%2 == 0: return "a"
	case i%3 == 0: return "b"
	case i == 7: return "c"
	default: return "d"
	}
}
```
Expect S2:
```
func Fn(i int) string {
	switch {
		case i%2 == 0: return "a"
		case i%3 == 0: return "b"
		case i == 7: return "c"
		default: return "d"
	}
}
```
Got S2:
```
func Fn(i int) string {
	switch {
	case i%2 == 0: return "a"
	case i%3 == 0: return "b"
	case i == 7: return "c"
	default: return "d"
	}
}
```
S2 PASS!

Real cases:


Case R1:
```
func (r Res[V, E]) Err(f func(Error[E])) V {
	if f == nil { return r.Value }
	if r.Error != nil { f(r.Error) }
	return r.Value
}
```
Expect R1:
```
func (r Res[V, E]) Err(f func(Error[E])) V {
	if f == nil { return r.Value }
	if r.Error != nil { f(r.Error) }
	return r.Value
}
```
Got R1:
```
func (r Res[V, E]) Err(f func(Error[E])) V {
	if f == nil { return r.Value }
	if r.Error != nil { f(r.Error) }
	return r.Value
}
```
R1 PASS!

Case R2:
```go
func Results[V, E any](value V, err any) (res Res[V, E]) {
	res = Res[V, E]{Value: value}
	if err == nil { return res }

	switch err := err.(type) {
	case Error[E]: res.Error = err
	case E: res.Error = Err[E]{Val: err}
	case string: res.Error = Err[E]{Err: StrError(err)}
	default: panic("invalid error type")
	}

	return res
}
```
Expect R2:
```go
func Results[V, E any](value V, err any) (res Res[V, E]) {
	res = Res[V, E]{Value: value}
	if err == nil { return res }

	switch err := err.(type) {
		case Error[E]: res.Error = err
		case E: res.Error = Err[E]{Val: err}
		case string: res.Error = Err[E]{Err: StrError(err)}
		default: panic("invalid error type")
	}

	return res
}
```
Got R2:
```go
func Results[V, E any](value V, err any) (res Res[V, E]) {
	res = Res[V, E]{Value: value}
	if err == nil { return res }

	switch err := err.(type) {
	case Error[E]: res.Error = err
	case E: res.Error = Err[E]{Val: err}
	case string: res.Error = Err[E]{Err: StrError(err)}
	default: panic("invalid error type")
	}

	return res
}
```
R2 FAIL!



Formatting not wanted:
Case N1:
```
func Fn(i int) string {
	switch {
	case i%2 == 0:
		println("a")
		return "a"
	case i%3 == 0:
		println("b")
		return "b"
	case i == 7:
		println("c")
		return "c"
	default:
		println("d")
		return "d"
	}
}
```
Got N1:
```
func Fn(i int) string {
	switch {
	case i%2 == 0: println("a")
		return "a"
	case i%3 == 0: println("b")
		return "b"
	case i == 7: println("c")
		return "c"
	default: println("d")
		return "d"
	}
}
```
N1 FAIL!

Case N2:
```
func Ok(isOk bool) string {
	if Ok {
		res := ""
		res += "b"
		return "b"
	}
	return "a"
}
```
Got N2:
```
func Ok(isOk bool) string {
	if Ok {
		res := ""
		res += "b"
		return "b"
	}
	return "a"
}
```
N2 PASS!
