select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 411 and ss.ss_hash <= 811 and hd.hd_hash >= 365 and hd.hd_hash <= 698 and i.i_hash >= 168 and i.i_hash <= 918
;
