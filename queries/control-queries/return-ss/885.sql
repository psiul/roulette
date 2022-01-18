select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and d.d_hash >= 72 and d.d_hash <= 405 and c.c_hash >= 131 and c.c_hash <= 881 and i.i_hash >= 593 and i.i_hash <= 993
;
