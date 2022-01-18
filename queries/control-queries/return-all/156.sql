select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,customer c,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 553 and ws.ws_hash <= 886 and cd.cd_hash >= 191 and cd.cd_hash <= 941 and sm.sm_hash >= 308 and sm.sm_hash <= 708
;
