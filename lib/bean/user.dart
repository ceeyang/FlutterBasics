class User {
  String id; //	编号
  String name; //	名称
  String code; //	账号
  String password; //	密码
  String sex; //0女 1男	性别
  String phone; //	手机号码

  String address; //	地址
  String email; //	邮箱地址
  String regional_name;
  String regional_code;
  String isshow_regional;
  String remark; //	备注
  String role; //
  String rolename; //角色名
  String token;
  String icon; //头像
  String telephone;
  String head_portrait;

  //百度推送userid和channelId
  String userId;
  String channelId;

  String fire_control_room_id; //监控室ID

  String fire_control_room_name; //监控室名称
  String change_shifts_detail_id; //倒班ID
  String daily_shift_detail_id; //班次 ID
  String daily_shift_detail_name; //班次名称

  String taskPlanId;

  String checkTableId; //关联检查表的ID
  String checkTableName; //关联检查表名称

  User(
      {this.id,
      this.name,
      this.code,
      this.password,
      this.sex,
      this.phone,
      this.address,
      this.email,
      this.regional_name,
      this.regional_code,
      this.isshow_regional,
      this.remark,
      this.role,
      this.rolename,
      this.token,
      this.icon,
      this.telephone,
      this.head_portrait,
      this.userId,
      this.channelId,
      this.fire_control_room_id,
      this.fire_control_room_name,
      this.change_shifts_detail_id,
      this.daily_shift_detail_id,
      this.daily_shift_detail_name,
      this.taskPlanId,
      this.checkTableId,
      this.checkTableName});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    sex = json['sex'];
    remark = json['remark'];
    password = json['password'];
    id = json['id'];
    rolename = json['rolename'];
    token = json['token'];
    name = json['name'];
    role = json['role'];
    code = json['code'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['sex'] = this.sex;
    data['remark'] = this.remark;
    data['password'] = this.password;
    data['id'] = this.id;
    data['head_portrait'] = this.head_portrait;
    data['rolename'] = this.rolename;
    data['token'] = this.token;
    data['name'] = this.name;
    data['role'] = this.role;
    data['isshow_regional'] = this.isshow_regional;
    data['regional_name'] = this.regional_name;
    data['code'] = this.code;
    data['regional_code'] = this.regional_code;
    data['email'] = this.email;
    data['address'] = this.address;

    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
