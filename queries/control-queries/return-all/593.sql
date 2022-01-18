select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,item i,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 250 and ws.ws_hash <= 583 and sm.sm_hash >= 424 and sm.sm_hash <= 824 and i.i_hash >= 208 and i.i_hash <= 958
;
