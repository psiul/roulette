select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 167 and ss.ss_hash <= 567 and d.d_hash >= 115 and d.d_hash <= 865 and i.i_hash >= 326 and i.i_hash <= 659
;
