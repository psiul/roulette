select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,store_returns sr,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and c.c_hash >= 127 and c.c_hash <= 877 and d.d_hash >= 142 and d.d_hash <= 475 and i.i_hash >= 535 and i.i_hash <= 935
;
