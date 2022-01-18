select count(ws.ws_item_sk)
from web_sales ws,customer c,ship_mode sm,customer_demographics cd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 127 and c.c_hash <= 877 and cd.cd_hash >= 589 and cd.cd_hash <= 989 and i.i_hash >= 21 and i.i_hash <= 354
;
