select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 147 and ws.ws_hash <= 897 and d.d_hash >= 461 and d.d_hash <= 861 and sm.sm_hash >= 60 and sm.sm_hash <= 393
;
