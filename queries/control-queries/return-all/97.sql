select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,item i,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 428 and d.d_hash <= 828 and cd.cd_hash >= 150 and cd.cd_hash <= 900 and hd.hd_hash >= 616 and hd.hd_hash <= 949
;
