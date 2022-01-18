select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,ship_mode sm,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 473 and i.i_hash <= 806 and sm.sm_hash >= 406 and sm.sm_hash <= 806 and cd.cd_hash >= 98 and cd.cd_hash <= 848
;
