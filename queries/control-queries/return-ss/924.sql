select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 70 and ss.ss_hash <= 820 and d.d_hash >= 256 and d.d_hash <= 656 and cd.cd_hash >= 544 and cd.cd_hash <= 877
;
