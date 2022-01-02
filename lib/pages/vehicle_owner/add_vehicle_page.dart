import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/model/owner/ambulance_model.dart';
import 'package:tquicker/model/owner/metro_name_model.dart';
import 'package:tquicker/model/owner/vahicle_category_model.dart';
import 'package:tquicker/model/owner/vehicle_length_model.dart';
import 'package:tquicker/model/owner/vehicle_load_capacity_model.dart';
import 'package:tquicker/model/owner/vehicle_metro_serial_model.dart';
import 'package:tquicker/model/owner/vehicle_seat_capacity.dart';
import 'package:tquicker/model/owner/vehicle_type_model.dart';
import 'package:tquicker/pages/vehicle_owner/owner_home_page.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';
import 'package:tquicker/widgets/drawer_widget.dart';

class AddVehiclePage extends StatefulWidget {
  final String ownerToken;
  bool? fromHome;
  AddVehiclePage({Key? key, required this.ownerToken,this.fromHome=false}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  bool _isLoading=false,_typeLoading=false;
  VehicleCategoryModel? _vehicleCategoryModel;
  VehicleTypeModel? _vehicleTypeModel;
  MetroNameModel? _metroNameModel;
  VehicleMetroSerialModel? _serialModel;
  VehicleSeatCapacityModel? _seatCapacityModel;
  VehicleLoadCapacityModel? _loadCapacityModel;
  VehicleLengthModel? _lengthModel;
  AmbulanceModel? _ambulanceModel;
  bool _isAmbulance=false, _isAC=false;

  final TextEditingController _serialNumber=TextEditingController(text: '');
  final TextEditingController _model=TextEditingController(text: '');
  final TextEditingController _brand=TextEditingController(text: '');
  final TextEditingController _mfgYear=TextEditingController(text: '');
  final TextEditingController _stand=TextEditingController(text: '');
  final TextEditingController _contactNo=TextEditingController(text: '');

  @override
  initState(){
    super.initState();
    print('Token: ${widget.ownerToken}');
    print('From Home: ${widget.fromHome}');
    OwnerController publicController= Get.find();

    if(publicController.vehicleCategoryList.isEmpty || publicController.metroNameList.isEmpty
        || publicController.vehicleTypeList.isEmpty || publicController.vehicleSeatCapacityList.isEmpty||
        publicController.vehicleLengthList.isEmpty || publicController.metroSerialList.isEmpty||
        publicController.loadCapacityList.isEmpty){
      publicController.getAllVehicleDataList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerController>(
      builder: (publicController) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: const DrawerWidget(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: (){
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(CupertinoIcons.bars,color: Colors.grey,size: customWidth(0.08))),
            title: Text('ADD Vehicles',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.w700,fontSize: customWidth(0.05))),
            titleSpacing: -10,
          ),
          body: _bodyUI(publicController),
        );
      }
    );
  }

  Widget _bodyUI(OwnerController publicController)=>SingleChildScrollView(
    physics:const ClampingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: customWidth(0.04)),
      child: Column(
        children: [
          SizedBox(height: customWidth(0.05)),

          ///Vehicle category and Type Dropdown
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                    color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<VehicleCategoryModel>(
                      value: _vehicleCategoryModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Category",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)async{
                        setState((){
                          _vehicleCategoryModel=value;
                          _vehicleTypeModel=null;
                        });
                        setState(()=>_typeLoading=true);
                        await publicController.getVehicleTypeByCategory(_vehicleCategoryModel!.id!.toString());
                        setState(()=>_typeLoading=false);
                      },
                      dropdownColor: Colors.white,
                      items: publicController.vehicleCategoryList.map<DropdownMenuItem<VehicleCategoryModel>>(
                              (VehicleCategoryModel model) {
                            return DropdownMenuItem<VehicleCategoryModel>(
                              value: model,
                              child: Text(
                                  model.category!,
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: customWidth(0.04)),
              Expanded(
                child:_typeLoading
                    ?const CupertinoActivityIndicator()
                    :Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<VehicleTypeModel>(
                      value: _vehicleTypeModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Type",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)=>setState(()=> _vehicleTypeModel=value),
                      dropdownColor: Colors.white,
                      items: publicController.vehicleTypeList.map<DropdownMenuItem<VehicleTypeModel>>(
                              (VehicleTypeModel model) {
                            return DropdownMenuItem<VehicleTypeModel>(
                              value: model,
                              child: Text(
                                  model.type!,
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          ///Metro and Serial Number
          Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                decoration: BoxDecoration(
                    color: ThemeAndColor.buttonBGColor,
                    border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<MetroNameModel>(
                    value: _metroNameModel,
                    isExpanded: true,
                    isDense: true,
                    hint: Text("Metro",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: customWidth(0.035),
                          fontWeight: FontWeight.w700,
                        )),
                    onChanged: (value)=>setState(()=> _metroNameModel=value),
                    dropdownColor: Colors.white,
                    items: publicController.metroNameList.map<DropdownMenuItem<MetroNameModel>>(
                            (MetroNameModel model) {
                          return DropdownMenuItem<MetroNameModel>(
                            value: model,
                            child: Text(
                                model.name!,
                                style: Theme.of(context).textTheme.headline3!.copyWith(
                                  fontSize: customWidth(0.035),
                                  fontWeight: FontWeight.w700,
                                )),
                          );
                        }).toList(),
                  ),
                ),
              )),
              SizedBox(width: customWidth(0.04)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: customWidth(0.015),bottom: customWidth(0.015), left: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<VehicleMetroSerialModel>(
                            value: _serialModel,
                            isExpanded: true,
                            isDense: true,
                            hint: Text("Serial",
                                style: Theme.of(context).textTheme.headline3!.copyWith(
                                  fontSize: customWidth(0.035),
                                  fontWeight: FontWeight.w700,
                                )),
                            onChanged: (value)=>setState(()=> _serialModel=value),
                            dropdownColor: Colors.white,
                            items: publicController.metroSerialList.map<DropdownMenuItem<VehicleMetroSerialModel>>(
                                    (VehicleMetroSerialModel model) {
                                  return DropdownMenuItem<VehicleMetroSerialModel>(
                                    value: model,
                                    child: Text(
                                        model.name!,
                                        style: Theme.of(context).textTheme.headline3!.copyWith(
                                          fontSize: customWidth(0.035),
                                          fontWeight: FontWeight.w700,
                                        )),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                      Expanded(child: TextField(
                        controller: _serialNumber,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:const EdgeInsets.all(0.0),
                          border: const UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Number',
                          hintStyle: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          ///Model & Brand
          Row(
            children: [
              Expanded(child: CustomTextFormField(controller: _model, hintText: 'Model',textInputType: TextInputType.text)),
              SizedBox(width: customWidth(0.04)),
              Expanded(child: CustomTextFormField(controller: _brand, hintText: 'Brand',textInputType: TextInputType.text)),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          ///Seat & Load Capacity Dropdown
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<VehicleSeatCapacityModel>(
                      value: _seatCapacityModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Seat Capacity",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)async{
                        setState((){
                          _seatCapacityModel=value;
                        });
                      },
                      dropdownColor: Colors.white,
                      items: publicController.vehicleSeatCapacityList.map<DropdownMenuItem<VehicleSeatCapacityModel>>(
                              (VehicleSeatCapacityModel model) {
                            return DropdownMenuItem<VehicleSeatCapacityModel>(
                              value: model,
                              child: Text(
                                  '${model.seatcapacity!} Seat',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: customWidth(0.04)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<VehicleLoadCapacityModel>(
                      value: _loadCapacityModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Load Capacity",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)=>setState(()=> _loadCapacityModel=value),
                      dropdownColor: Colors.white,
                      items: publicController.loadCapacityList.map<DropdownMenuItem<VehicleLoadCapacityModel>>(
                              (VehicleLoadCapacityModel model) {
                            return DropdownMenuItem<VehicleLoadCapacityModel>(
                              value: model,
                              child: Text(
                                  model.loadcapacity!,
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          ///Vehicle Length & mfg_year
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<VehicleLengthModel>(
                      value: _lengthModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Vehicle Length",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)=>setState(()=> _lengthModel=value),
                      dropdownColor: Colors.white,
                      items: publicController.vehicleLengthList.map<DropdownMenuItem<VehicleLengthModel>>(
                              (VehicleLengthModel model) {
                            return DropdownMenuItem<VehicleLengthModel>(
                              value: model,
                              child: Text(
                                  model.vehiclelength!,
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: customWidth(0.04)),
              Expanded(child: CustomTextFormField(controller: _mfgYear, hintText: 'Mfg. year',textInputType: TextInputType.number))
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          CustomTextFormField(controller: _contactNo, hintText: 'Contact No',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),

          CustomTextFormField(controller: _stand, hintText: 'Vehicle Stand',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.04)),

          ///Ambulance & AC
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(value: _isAmbulance,
                        onChanged: (val)=>
                            setState(()=> _isAmbulance=val!)),
                    Expanded(
                      child: Text('Ambulance',style:Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: customWidth(0.035),
                        fontWeight: FontWeight.w700,
                      )),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Checkbox(value: _isAC, onChanged: (val)=>
                        setState(()=> _isAC=val!)),

                    Expanded(
                      child: Text('AC Available',style:Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: customWidth(0.035),
                        fontWeight: FontWeight.w700,
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: customWidth(0.04)),

          _isAmbulance
              ?Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: customWidth(0.015), horizontal: customWidth(0.04)),
                  decoration: BoxDecoration(
                      color: ThemeAndColor.buttonBGColor,
                      border: Border.all(color: ThemeAndColor.themeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(customWidth(0.025)))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<AmbulanceModel>(
                      value: _ambulanceModel,
                      isExpanded: true,
                      isDense: true,
                      hint: Text("Ambulance Type",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: customWidth(0.035),
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (value)=>setState(()=> _ambulanceModel=value),
                      dropdownColor: Colors.white,
                      items:AmbulanceModel.ambulanceList.map<DropdownMenuItem<AmbulanceModel>>(
                              (AmbulanceModel model) {
                            return DropdownMenuItem<AmbulanceModel>(
                              value: model,
                              child: Text(
                                  model.ambulance!,
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: customWidth(0.035),
                                    fontWeight: FontWeight.w700,
                                  )),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          )
              :Container(),
          _isAmbulance?SizedBox(height: customWidth(0.06)):Container(),

          _isLoading
              ?spinCircle()
              :SolidButton(child: Text('Send',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
              onPressed: (){
                _addVehicle(publicController);
              },
              height: customWidth(0.1),
              width: customWidth(0.4),
              borderRadius: customWidth(0.02)),
        ],
      ),
    ),
  );

  Future<void> _addVehicle(OwnerController publicController)async{
    setState(()=>_isLoading=true);
    Map dataMap={
      'vh_category':_vehicleCategoryModel!.id.toString(),
      'vh_type': _vehicleTypeModel!.id.toString(),
      'vh_contact_no': _contactNo.text,
      'metro_name_id': _metroNameModel!.id.toString(),
      'metro_serial_id': _serialModel!.id.toString(),
      'vh_number': _serialNumber.text,
      'vh_load_capacity': _loadCapacityModel!.id.toString(),
      'vh_seat_capacity': _seatCapacityModel!.id.toString(),
      'vh_length': _lengthModel!.id.toString(),
      'vh_stand': _stand.text,
      'vh_brand': _brand.text,
      'vh_model': _model.text,
      'vh_mfg_year': _mfgYear.text,
      'vh_ambulance_type': _isAmbulance
          ?_ambulanceModel!=null
          ?_ambulanceModel!.id
          :'0'
          :'',
      'vh_ac_status': _isAC?'0':'1'
    };
    await publicController.addOwnerVehicle(dataMap).then((result)async{
      if(result){
        setState(()=>_isLoading=false);
        if(!widget.fromHome!){
          showToast('Vehicle Added');
          Get.to(()=>const OwnerHomePage());
        }else {
          showToast('Vehicle Added');
          await publicController.getOwnerVehicles();
          Get.back();
        }

      }else{
        setState(()=>_isLoading=false);
        //showToast('Registration Failed!');
      }
    });
  }
}
