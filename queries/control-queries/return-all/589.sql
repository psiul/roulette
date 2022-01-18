select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,date_dim d,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 127 and ws.ws_hash <= 460 and d.d_hash >= 473 and d.d_hash <= 873 and i.i_hash >= 242 and i.i_hash <= 992
;
