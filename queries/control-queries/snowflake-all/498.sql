select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,household_demographics hd,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 198 and d.d_hash <= 531 and hd.hd_hash >= 218 and hd.hd_hash <= 968 and cd.cd_hash >= 264 and cd.cd_hash <= 664
;
