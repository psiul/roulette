select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 208 and ss.ss_hash <= 958 and d.d_hash >= 449 and d.d_hash <= 782 and cd.cd_hash >= 282 and cd.cd_hash <= 682
;
