select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,customer c,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 375 and i.i_hash <= 775 and hd.hd_hash >= 376 and hd.hd_hash <= 709 and sm.sm_hash >= 16 and sm.sm_hash <= 766
;
