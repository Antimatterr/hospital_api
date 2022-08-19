# hospital_api
Libraries/Framework used : Express.js + Nodejs\
Database used : MySQL\
npm packages used : bcrypt (password encryption)
                  : morgan (for API request logs)
                  : multer (for multipart data)
                  : mysql (for executing myql queries)
                  : joi (for input data validation)
API Endpoints : 
  1. register patient : http://localhost:3000/api/v1/register
                      : Body 
                        {
                          name,
                          email,
                          address,
                          phone,
                          password,
                          image
                        }
                      : Request Headers
                        {
                          psychiatrist_id 
                        }
                      
  3. hospital data : http://localhost:3000/api/v1/hospital/4
                      Params
                     {
                      hospital ID
                     }
                     
                     [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/fd3c580a8d81d627b10e?action=collection%2Fimport)
