class GroupTransaction {
  
  final DateTime Date;
  final String Name;
  final String Description;
  final bool IsClosed;
  final String Mem1;
  final int Amt1;
  final String Mem2;
  final int Amt2;
  final String Mem3;
  final int Amt3;
  final String Mem4;
  final int Amt4;
  final String Mem5;
  final int Amt5;

  GroupTransaction(this.Date,this.Name,this.Description,this.IsClosed,this.Mem1,this.Amt1,this.Mem2,this.Amt2,this.Mem3,this.Amt3,this.Mem4,this.Amt4,this.Mem5,this.Amt5);
  GroupTransaction.fromJson(Map<dynamic, dynamic> json)
    : Date = DateTime.parse(json['Date'] as String),
      Name = json['Name'] as String,
      Description = json['Description'] as String,
      IsClosed =json['IsClosed'] as bool,
      Mem1 = json['Mem1'] as String,
      Amt1 = json['Amt1'] as int,
      Mem2 = json['Mem2'] as String,
      Amt2 = json['Amt2'] as int,
      Mem3 = json['Mem3'] as String,
      Amt3 = json['Amt3'] as int,
      Mem4 = json['Mem4'] as String,
      Amt4 = json['Amt4'] as int,
      Mem5 = json['Mem5'] as String,
      Amt5 = json['Amt5'] as int
      ;

Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'Date': Date.toString(),
      'Name' : Name,
      'Description':Description,
      'IsClosed':IsClosed,
      'Mem1':Mem1,
      'Amt1':Amt1,
      'Mem2':Mem2,
      'Amt2':Amt2,
      'Mem3':Mem3,
      'Amt3':Amt3,
      'Mem4':Mem4,
      'Amt4':Amt4,
      'Mem5':Mem5,
      'Amt5':Amt5,
    };
}