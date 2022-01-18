select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,household_demographics hd,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 518 and ws.ws_hash <= 918 and cd.cd_hash >= 473 and cd.cd_hash <= 806 and hd.hd_hash >= 178 and hd.hd_hash <= 928
;
