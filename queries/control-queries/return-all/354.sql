select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and cd.cd_hash >= 212 and cd.cd_hash <= 962 and d.d_hash >= 566 and d.d_hash <= 899 and i.i_hash >= 107 and i.i_hash <= 507
;
