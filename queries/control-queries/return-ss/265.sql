select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 216 and ss.ss_hash <= 966 and d.d_hash >= 578 and d.d_hash <= 978 and i.i_hash >= 541 and i.i_hash <= 874
;
