select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 369 and ss.ss_hash <= 769 and cd.cd_hash >= 645 and cd.cd_hash <= 978 and i.i_hash >= 131 and i.i_hash <= 881
;
