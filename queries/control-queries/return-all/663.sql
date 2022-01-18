select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_demographics cd,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 482 and c.c_hash <= 882 and cd.cd_hash >= 136 and cd.cd_hash <= 469 and sm.sm_hash >= 235 and sm.sm_hash <= 985
;
