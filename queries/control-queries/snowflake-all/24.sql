select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,customer_demographics cd,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 628 and ws.ws_hash <= 961 and cd.cd_hash >= 187 and cd.cd_hash <= 587 and sm.sm_hash >= 2 and sm.sm_hash <= 752
;
