select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 273 and ss.ss_hash <= 673 and cd.cd_hash >= 612 and cd.cd_hash <= 945 and d.d_hash >= 9 and d.d_hash <= 759
;
