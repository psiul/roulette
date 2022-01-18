select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,customer c,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 124 and i.i_hash <= 457 and sm.sm_hash >= 283 and sm.sm_hash <= 683 and cd.cd_hash >= 115 and cd.cd_hash <= 865
;
