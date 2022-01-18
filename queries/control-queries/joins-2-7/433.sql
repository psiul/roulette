select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 468 and ss.ss_hash <= 968 and i.i_hash >= 780 and i.i_hash <= 980
;
