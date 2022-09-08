import CustomErrorHandler from "../services/CustomErrorHandler";
import JwtService from "../services/JwtService";


const userAuth = async (req, res, next) => {
  let authHeader = req.headers.authorization;
  // console.log(authHeader);
  if (!authHeader) {
    return next(CustomErrorHandler.unAuthorized());
  }

  const token = authHeader.split(' ')[1];

  try {
    const { id } = await JwtService.verify(token);
    req.user = {};
    req.user.id = id;
    // console.log(req.user.id)
    next();  //this line will pass the coontrol from this middleware to login controller of the user
  } catch (err) {
    return next(CustomErrorHandler.unAuthorized());
  }
}

export default userAuth;