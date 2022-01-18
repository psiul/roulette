select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 112 and ws.ws_hash <= 512 and hd.hd_hash >= 5 and hd.hd_hash <= 755 and cd.cd_hash >= 662 and cd.cd_hash <= 995
;
