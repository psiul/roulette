select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer c,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 159 and sm.sm_hash <= 909 and d.d_hash >= 435 and d.d_hash <= 835 and cd.cd_hash >= 549 and cd.cd_hash <= 882
;
