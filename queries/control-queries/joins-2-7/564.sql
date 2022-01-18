select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 450 and ss.ss_hash <= 650 and i.i_hash >= 390 and i.i_hash <= 890
;
