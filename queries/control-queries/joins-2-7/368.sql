select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 653 and ss.ss_hash <= 853 and i.i_hash >= 439 and i.i_hash <= 939
;
