select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,date_dim d,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 152 and ws.ws_hash <= 552 and sm.sm_hash >= 189 and sm.sm_hash <= 939 and cd.cd_hash >= 513 and cd.cd_hash <= 846
;
