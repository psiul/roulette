select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,date_dim d,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 530 and ws.ws_hash <= 930 and sm.sm_hash >= 125 and sm.sm_hash <= 458 and d.d_hash >= 129 and d.d_hash <= 879
;
