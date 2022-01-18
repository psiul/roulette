select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 59 and hd.hd_hash <= 392 and i.i_hash >= 208 and i.i_hash <= 958 and cd.cd_hash >= 196 and cd.cd_hash <= 596
;
