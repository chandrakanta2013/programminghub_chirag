# Programming Hub

# saveProgram

```javascript
Sample Request

{
	"data": {
		"programname": "Sum",
		"programcategory": "Algorithms",
		"code": "<?php function sum(a, b) { return a + b; } ?>",
		"programlanguage": "php",
		"programdescription": "It does sum",
		"exampleoutput": " 6 + 6 => 12",
		"difficultylevel": "1",
		"Isrunnable": "Y",
		"input": ["3,4", "9,3", "3,2"],
		"output": ["7", "12", "5"]
	}
}
```

```javascript
Sample Response

{
    "message": "SUCCESS",
    "reason": ""
}
```


# getProgram

```javascript
Sample Request

http://localhost:3000/programminghub/getProgram?version=123&client=android&app=p_hub&language=php
```

```javascript
Sample Response

{
	"language": "",
	"category": [
		"Algorithms",
		"Algorithms"
	],
	"name": [
		"Multiplication",
		"Sum"
	],
	"desc": [
		"It does multiplication",
		"It does sum"
	],
	"program": [
		"<?php function mul(a, b) { return a * b; } ?>",
		"<?php function sum(a, b) { return a + b; } ?>"
	],
	"output": [
		[
			"12",
			"27",
			"6"
		],
		[
			"7",
			"12",
			"5"
		]
	],
	"input": [
		[
			"3,4",
			"9,3",
			"3,2"
		],
		[
			"3,4",
			"9,3",
			"3,2"
		]
	],
	"runnable": [
		"Y",
		"Y"
	],
	"message": "SUCCESS",
	"reason": ""
}
```
