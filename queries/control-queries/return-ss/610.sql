select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 146 and ss.ss_hash <= 896 and d.d_hash >= 512 and d.d_hash <= 912 and i.i_hash >= 207 and i.i_hash <= 540
;
