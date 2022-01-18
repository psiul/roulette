select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 298 and ss.ss_hash <= 631 and cd.cd_hash >= 154 and cd.cd_hash <= 904 and i.i_hash >= 274 and i.i_hash <= 674
;
