select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,household_demographics hd,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 18 and ws.ws_hash <= 768 and hd.hd_hash >= 439 and hd.hd_hash <= 772 and cd.cd_hash >= 4 and cd.cd_hash <= 404
;
