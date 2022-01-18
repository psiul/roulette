select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 366 and ss.ss_hash <= 766 and i.i_hash >= 145 and i.i_hash <= 895 and d.d_hash >= 207 and d.d_hash <= 540
;
