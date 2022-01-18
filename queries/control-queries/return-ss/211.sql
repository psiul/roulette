select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 510 and ss.ss_hash <= 843 and i.i_hash >= 536 and i.i_hash <= 936 and d.d_hash >= 167 and d.d_hash <= 917
;
