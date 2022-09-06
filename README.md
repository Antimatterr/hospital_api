
# Hospital API

This is basic hospital API implementation using nodejs and mysql as database and swagger for API documentation.


## API Reference

#### Get all details of hospital

```http
  GET /api/hospital/${hospital_id}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `hospital_id` | `string` | **Required**. ID of hospital |

#### Register User

```http
  POST /api/v1/register
```

| Formdata | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `name`      | `string` | **Required**. name of user |
| `email`      | `string` | **Required**. email of user |
| `address`      | `string` | **Required**. address of user |
| `password`      | `string` | **Required**. password of user |
| `phone`      | `string` | **Required**. phone number of user |
| `image`      | `file` | **Required**. imae of user |

| Header | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Authorization` | `Integer(test purpose)`  | **Required**. Doctor UID  |

#### add(num1, num2)
Takes two numbers and returns the sum.

