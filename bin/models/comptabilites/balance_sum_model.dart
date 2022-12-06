class BalanceSumModel { 
  late String comptes;
  late double debit;
  late double credit; 

  BalanceSumModel({ 
      required this.comptes,
      required this.debit,
      required this.credit 
    }
  );

  factory BalanceSumModel.fromSQL(List<dynamic> row) {
    return BalanceSumModel(
      comptes: row[0],
      debit: row[1],
      credit: row[2]
    );
  }


  factory BalanceSumModel.fromJson(Map<String, dynamic> json) {
    return BalanceSumModel( 
      comptes: json['comptes'],
      debit: json['sum'],
      credit: json['sum'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return { 
      'comptes': comptes,
      'debit': debit,
      'credit': credit 
    };
  }
}


class BalanceChartModel {
  late String comptes;
  late DateTime created;
  late double debit;
  late double credit;

  BalanceChartModel(
      {required this.comptes, required this.created, required this.debit, required this.credit});

  factory BalanceChartModel.fromSQL(List<dynamic> row) {
    return BalanceChartModel(
      comptes: row[0], created: row[1], debit: row[2], credit: row[3]);
  }

  factory BalanceChartModel.fromJson(Map<String, dynamic> json) {
    return BalanceChartModel(
      comptes: json['comptes'],
      created: DateTime.parse(json['created']),
      debit: json['sum'],
      credit: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comptes': comptes,
      'created': created.toIso8601String(),
      'debit': debit, 
      'credit': credit
    };
  }
}



class BalancePieChartModel {
  final String comptes;
  final int count;

  BalancePieChartModel({required this.comptes, required this.count});

  factory BalancePieChartModel.fromSQL(List<dynamic> row) {
    return BalancePieChartModel(
      comptes: row[0],
      count: row[1],
    );
  }

  factory BalancePieChartModel.fromJson(Map<String, dynamic> json) {
    return BalancePieChartModel(comptes: json['comptes'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'comptes': comptes, 'count': count};
  }
}
