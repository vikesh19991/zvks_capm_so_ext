namespace zvks.srv.so_service;

using {zvks.db.data_model} from '../db/data-model';

service SalesOrderSRV {

    entity SalesOrderItemSet   as projection on data_model.SalesOrderItems {
        *
    };

    entity ScheduleLineSet as projection on data_model.ScheduleLines {
        *
    };
}
