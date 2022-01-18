select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 408 and ss.ss_hash <= 741 and d.d_hash >= 352 and d.d_hash <= 752 and i.i_hash >= 102 and i.i_hash <= 852
;
