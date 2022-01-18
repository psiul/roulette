select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer_demographics cd,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 105 and ws.ws_hash <= 855 and cd.cd_hash >= 205 and cd.cd_hash <= 538 and sm.sm_hash >= 116 and sm.sm_hash <= 516
;
