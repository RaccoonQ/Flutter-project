/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH - MailTo: ray@flutterengineer.com, Twitter: Rayscode
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 */

class WooJWTResponse {
  String token;
  int userId;
  int expiry;
  String message;
  int status;
  String userEmail;
  String userNicename;
  String userDisplayName;

  WooJWTResponse(
      {this.token,
      this.userEmail,
      this.userId,
      this.expiry,
      this.message,
      this.userNicename,
      this.userDisplayName});

  WooJWTResponse.fromJson(Map<String, dynamic> json) {
    token = json['data']['user_token'];
    userId = json['data']['user_id'];
    expiry = json['data']['expiry'];
    message = json['message'];
    status = json['status'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['expiry'] = this.expiry;
    data['message'] = this.message;
    data['status'] = this.status;
    data['user_email'] = this.userEmail;
    data['user_nicename'] = this.userNicename;
    data['user_display_name'] = this.userDisplayName;
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

// authenticateViaJWT(
//       {String userToken,
//       String email,
//       String username,
//       String password}) async {
//     try {
//       WooJWTResponse wpUserLoginResponse =
//           await WPJsonAPI.instance.api((request) {
//         return request.wpLogin(
//             email: email, password: password, authType: WPAuthType.WpEmail);
//       });

//       // Get WP user info
//       WPUserInfoResponse wpUserInfoResponse =
//           await WPJsonAPI.instance.api((request) {
//         return request.wpGetUserInfo(wpUserLoginResponse.data.userToken);
//       });
//       token = wpUserLoginResponse.data.userToken;
//       userEmail = wpUserInfoResponse.data.email;
//       userNicename = wpUserInfoResponse.data.userNicename;
//       userDisplayName = wpUserInfoResponse.data.displayName;
//       final Map<String, dynamic> data = new Map<String, dynamic>();
//       data['token'] = this.token;
//       data['user_email'] = this.userEmail;
//       data['user_nicename'] = this.userNicename;
//       data['user_display_name'] = this.userDisplayName;
//       return data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
