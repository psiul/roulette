select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 495 and ss.ss_hash <= 995 and i.i_hash >= 62 and i.i_hash <= 262
;
